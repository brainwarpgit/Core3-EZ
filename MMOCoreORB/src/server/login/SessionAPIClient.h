/*
                Copyright <SWGEmu>
        See file COPYING for copying conditions.*/

/**
 * @author      : lordkator (lordkator@swgemu.com)
 * @file        : SessionAPIClient.h
 * @created     : Fri Nov 29 10:04:14 UTC 2019
 */

#ifdef WITH_SESSION_API
#pragma once

#include "engine/engine.h"
#include "system/thread/atomic/AtomicInteger.h"
#include "server/login/account/Account.h"
#include "server/login/LoginClient.h"

namespace server {
	namespace login {
		class SessionApprovalResult {
		public:
			enum ApprovalAction {
				UNKNOWN = -2,
				TEMPFAIL = -1,
				ALLOW = 0,
				WARN = 1,
				REJECT = 2,
				BAN = 3
			};

		private:
			String resultTrxId;
			String resultClientTrxId;
			ApprovalAction resultAction;
			String resultTitle;
			String resultMessage;
			String resultDetails;
			String resultRawJSON;
			HashTable<String, String> resultDebug;

		public:
			SessionApprovalResult();

			String toString() const;
			String getLogMessage() const;

			String actionToString(ApprovalAction action) const {
				switch (action) {
				case ApprovalAction::UNKNOWN:	return String("UNKNOWN");
				case ApprovalAction::TEMPFAIL:	return String("TEMPFAIL");
				case ApprovalAction::ALLOW:		return String("ALLOW");
				case ApprovalAction::WARN:		return String("WARN");
				case ApprovalAction::REJECT:	return String("REJECT");
				case ApprovalAction::BAN:		return String("BAN");
				}

				return String("UNKOWN(" + String::valueOf((int)action) + ")");
			}

			inline void setAction(String stringAction) {
				if (stringAction == "TEMPFAIL") {
					resultAction = ApprovalAction::TEMPFAIL;
					return;
				}

				if (stringAction == "ALLOW") {
					resultAction = ApprovalAction::ALLOW;
					return;
				}

				if (stringAction == "WARN") {
					resultAction = ApprovalAction::WARN;
					return;
				}

				if (stringAction == "REJECT") {
					resultAction = ApprovalAction::REJECT;
					return;
				}

				if (stringAction == "BAN") {
					resultAction = ApprovalAction::BAN;
					return;
				}

				resultAction = ApprovalAction::UNKNOWN;
			}

			inline void setTrxId(String trxId) {
				resultDebug.put("trx_id", trxId);
			}

			inline String getTrxId() const {
				if (resultDebug.containsKey("trx_id")) {
					return resultDebug.get("trx_id");
				}

				return String("<not set>");
			}

			inline void setClientTrxId(String clientTrxId) {
				resultClientTrxId = clientTrxId;
			}

			inline String getClientTrxId() const {
				return resultClientTrxId;
			}

			inline void setAction(ApprovalAction action) {
				resultAction = action;
			}

			inline ApprovalAction getAction() const {
				return resultAction;
			}

			inline bool isActionTemporaryFailure() const {
				return resultAction == ApprovalAction::TEMPFAIL;
			}

			inline bool isActionAllowed() const {
				return resultAction == ApprovalAction::ALLOW;
			}

			inline bool isActionWarning() const {
				return resultAction == ApprovalAction::WARN;
			}

			inline bool isActionRejected() const {
				return resultAction == ApprovalAction::REJECT;
			}

			inline bool isActionBan() const {
				return resultAction == ApprovalAction::BAN;
			}

			inline void setTitle(String title) {
				resultTitle = title;
			}

			inline String getTitle() const {
				return resultTitle;
			}

			inline void setMessage(String message) {
				resultMessage = message;
			}

			inline String getMessage(bool appendTrxId = false) const {
				if (!appendTrxId || !resultDebug.containsKey("trx_id")) {
					return resultMessage;
				}

				return resultMessage + "\n\ntrx_id: " + resultDebug.get("trx_id");
			}

			inline void setDetails(String details) {
				resultDetails = details;
			}

			inline String getDetails() const {
				return resultDetails;
			}

			inline void setDebugValue(const String key, const String value) {
				resultDebug.put(key, value);
			}

			inline String getDebugValue(const String key) const {
				if (resultDebug.containsKey(key))
					return resultDebug.get(key);

				return String("");
			}

			inline HashTable<String, String> getDebugHashTable() const {
				return resultDebug;
			}

			inline String getRawJSON() const {
				return resultRawJSON;
			}

			inline void setRawJSON(String json) {
				resultRawJSON = json;
			}
		};

		class SessionAPIClient : public Logger, public Singleton<SessionAPIClient>, public Object {
		protected:
			AtomicInteger trxCount = 0;
			int debugLevel = 0;
			String apiToken = "";
			String baseURL = "";
			bool dryRun = false;
			bool failOpen = false;

		public:
			SessionAPIClient();
			~SessionAPIClient();

			inline void incrementTrxCount() {
				trxCount.increment();
			}

			inline void setDebugLevel(int newDebugLevel) {
				debugLevel = newDebugLevel;
			}

			inline int getDebugLevel() const {
				return debugLevel;
			}

			String toString();

			// Hook for console "sessionapi" command
			bool consoleCommand(String arguments);

			// API Helpers
			SessionApprovalResult& apiCall(String src, int debugLevel, String basePath);
			void apiNotify(String src, int debugLevel, const String basePath);

			// Calls in general order of execution
			SessionApprovalResult& approveNewSession(LoginClient* client, Account* account);
			SessionApprovalResult& startNewSession(LoginClient* client, Account* account);
			void notifyDisconnectClient(const String ip, uint32 accountID, uint64_t characterID, String eventType);
			SessionApprovalResult& approvePlayerConnect(const String ip, uint32 accountID, uint64_t characterID);
			void notifyPlayerOnline(const String ip, uint32 accountID, uint64_t characterID);
			void notifyPlayerOffline(const String ip, uint32 accountID, uint64_t characterID);
		};
	}
}

using namespace server::login;

#endif // WITH_SESSION_API
