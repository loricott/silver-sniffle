# NCURSES Encrypted TCP Chat

This is an encrypted chat via the command line! It was done using [ncurses](https://www.gnu.org/software/ncurses/) to build the whole user interface. 
I wanted to do a client-server example of a chat, were also the messages would be encrypted from end to end. 

Upon accepting the connection of a new client, the first message the server gets is the `public key` from the client, which is later sent to all listening sockets (clients). The messages are first encrypted using logged client's `public keys` before being sent to back to the server. Other listening clients will unencrypt their messages by using their `private key`.

The project consists of 3 main parts, 
* TCP Server -> you could use [ngrok](https://ngrok.com/docs#tcp-examples) to accept network trafic on a dedicated port, and be like a real chat!
* Client
* Terminal user interface

In the gifs below, the right terminal was opened using telnet ([install](https://askubuntu.com/a/882032) on linux) to showcase how a person not using the client would see the messages from users using this project's client. 

Official Client            |  Connected using telnet
:-------------------------:|:-------------------------:
![](https://github.com/edghyhdz/silver-sniffle/blob/main/images/client.gif)  |  ![](https://github.com/edghyhdz/silver-sniffle/blob/main/images/telnet.gif)

The example below showcases two clients, were the messages are encrypted end to end.

Official Client `A`          |  Official Client `B`
:-------------------------:|:-------------------------:
![](https://github.com/edghyhdz/silver-sniffle/blob/main/images/client_a.gif)  |  ![](https://github.com/edghyhdz/silver-sniffle/blob/main/images/client_b.gif)

---

Conntact me on twitter [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/messages/compose?recipient_id=46040819) | [Create an issue](https://github.com/edghyhdz/silver-sniffle/issues/new)


## Table of Contents

1. [Motivation and Disclaimer](#motivation-and-disclaimer)
2. [Notes about this fork](#notes-about-this-fork)
3. [Description](#description)
4. [Dependencies](#dependencies)
5. [Compilation](#compilation)
6. [Installation](#installation)
7. [References](#references)
8. [Author](#author)

## Motivation and Disclaimer
What can I say, I love ncurses and I wanted to do an example of something that required encryption, the idea of a TCP Chat was the first thing that came into my mind.

This was just a project made out of curiosity, the use that you might give to this tool is at your own risk.

## Notes about this fork
This fork of the original project by Edgar Hernandez has been made by Lorenzo Ricotti for two reasons:
- reuse of the ideas in the code for a personal project
- fixing and cleaning up of the original code, which at the moment of the fork was not compiling (missing #include in the server code).
It is intended that also the deprecated calls will have to be fixed.

## Description
This command line TCP Chat was built using [ncurses](https://www.gnu.org/software/ncurses/). 

#### Server
The server is running constantly, and could also be used on a raspberry pi in combination with [ngrok](https://ngrok.com/docs#tcp-examples). By doing so, you could open your chat to other peers and have a secure way of messaging. 

#### Client
The client has a nice UI to be used on the terminal. The client first connects to the server and sends its `public key` to the server. The server retrieves this information and sends it to all users using this client. 

Every client will then encrypt their messages with the other listening  clients' `public keys`. The server will then get each corresponding listening client's message and send it accordingly. 

Once the encrypted message is received on the other clients' side, it is unencrypted using the user's `private key`.

**The client renews its key pairs everytime you start it.**

## Dependencies
 1. [ncurses](https://www.gnu.org/software/ncurses/)``` sudo apt install libncurses5-dev libncursesw5-dev```
 2. [Open SSL](https://www.openssl.org/) ``` sudo apt-get install libssl-dev```
 3. [cmake](https://www.gnu.org/software/make/) ``` sudo apt-get -y install cmake```

## Compilation
Two simple scripts are provided, one to compile everything, one to clean everything up.
1. compile.bash
2. clean.bash

The client source code is stored under the 'src' directory.
The server source code is stored under the 'server' directory.
When compiling, the two directories 'build_server' and 'build_client' are created.


Clone this repository like so, 
 ```sh
 git clone https://github.com/edghyhdz/silver-sniffle.git
 ```

 Once inside the root project folder `silver-sniffle`,
 ```sh
 # Compile client and server
./compile.bash 
```

And that's all.

## Installation
The final project folder structure is the following, 

    .
    ├── ...
    ├── build_client              # Directory were project was built
    │   ├── executable            # Client executable location
    │   │   └─── silver_sniffle   # Client executable
    │   └── certificates          # key pair location
    ├── ...
    ├── build_server              # Directory were project was built
    │   ├── silver_server         # Client executable
    └── ...

Once the compilation has been done, just run the executables as instructed here below. They can also be moved to other more suitable directories.

## Usage
As per default, the port to which the server is connecting to is `54000`

**Starting the Server** (In case you are running the server)
```sh
./build_server/silver_server
```

**Starting the Client**
```sh
.//build_client/executable/silver_sniffle 127.0.0.1 54000
```

`127.0.0.1` and the port `54000` could be changed for example to your own `TCP` address if you've got one. Of course, the server would have to be running on that address.
Please note that the client requires the IP address and the port arguments.

## References
The most relevant references are the following, 

1. Part of this code was taken from user Sloan Kelly, and adapted to this script to run on linux and work with Ncurses
link to his repo [here](https://bitbucket.org/sloankelly/youtube-source-repository/src/master/cpp/networking/MultipleClientsBarebonesServer/MultipleClientsBarebonesServer/)
2. To encryt the messages, I took the [this](https://www.programmersought.com/article/37955188510/) code snippet from [ProgrammerSought](https://www.programmersought.com/) as an example
3. Finally, to generate the key pairs I used [this](https://www.dynamsoft.com/codepool/how-to-use-openssl-generate-rsa-keys-cc.html) code snippet from [Dynamsoft](https://www.dynamsoft.com)

More references can be found inside the code.

## Author
Original author: Edgar Hernandez

Owner of this fork: Lorenzo Ricotti
