/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#include "PingServer.h"

#include <stddef.h>

#include "engine/service/MessageQueue.h"
#include "engine/service/ServiceClientMap.h"
#include "server/ping/PingClient.h"
#include "system/io/PrintStream.h"
#include "system/lang/Exception.h"
#include "system/lang/String.h"
#include "system/lang/StringBuffer.h"
#include "system/lang/System.h"
#include "system/net/Packet.h"
#include "system/net/PacketIndexOutOfBoundsException.h"
#include "system/platform.h"
#include "system/util/HashTable.h"

namespace engine {
namespace service {
class Message;
class ServiceClient;
}  // namespace service
}  // namespace engine
namespace sys {
namespace net {
class Socket;
class SocketAddress;
}  // namespace net
}  // namespace sys

PingServer::PingServer() : DatagramServiceThread("PingServer") {
	//setLockName("PingServerLock");

	setHandler(this);

	setLogging(false);
}

PingServer::~PingServer() {
}

void PingServer::initialize() {
}

void PingServer::run() {
	// recieve messages
	receiveMessages();

	shutdown();
}

void PingServer::shutdown() {
	HashTable<uint64, ServiceClient*> clientsCopy;
	clientsCopy.copyFrom(clients);

	HashTableIterator<uint64, ServiceClient*> itr = clientsCopy.iterator();

	while (itr.hasNext()) {
		PingClient* ping = cast<PingClient*>(itr.getNextValue());

		if (ping != NULL) {
			ping->disconnect();
		}
	}
}

PingClient* PingServer::createConnection(Socket* sock, SocketAddress& addr) {
	PingClient* client = new PingClient(this, sock, addr);

	info("client connected from \'" + client->getAddress() + "\'");

	return client;
}

void PingServer::handleMessage(ServiceClient* client, Packet* message) {
	PingClient* lclient = cast<PingClient*>(client);

	try {

		if (lclient->isAvailable() && (message->size() == 4)) {
			lclient->updateNetStatus();

			Packet* mess = message->clone();

			lclient->send(mess);
		}

	} catch (PacketIndexOutOfBoundsException& e) {
		System::out << e.getMessage();

		error("incorrect packet - " + message->toStringData());
	} catch (Exception& e) {
		error(e.getMessage());
	}
}

bool PingServer::handleError(ServiceClient* client, Exception& e) {
	PingClient* lclient = cast<PingClient*>(client);

	if (lclient != NULL) {
		lclient->setError();

		lclient->disconnect();
	}

	return true;
}

void PingServer::processMessage(Message* message) {

}

void PingServer::printInfo() {
	lock();

	StringBuffer msg;
	msg << "MessageQueue - size = " << messageQueue.size();
	info(msg, true);

	unlock();
}
