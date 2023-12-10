
## Understanding AsyncAPI Components through Chan and Eve's Programming Session

- **Info (Metadata about the API):**

Just as the name tag on Chan's spaceship provides essential details like the spaceship's name and model, the `info` section in AsyncAPI serves a similar purpose. It provides crucial information about the API, such as the title, version, and contact details. This metadata helps developers understand the basic details of the API they're working with.

```yml
asyncapi: '3.0.0'
info:
  title: Space Communication API
  version: '1.0.0'
  description: API for communication between spaceship and control room
```

- **Servers (Communication servers in the API):**

Imagine that Chan's spaceship communicates with different parts of the universe, including Capuccinova and other regions, through various servers. In AsyncAPI, the `servers` section describes the servers our API will communicate with, including their URLs, protocols, and descriptions.

```yml
servers:
  production:
    url: mqtt://test.mosquitto.org
    protocol: mqtt
    description: Production server
```

- **Channels (Communication channels in the API):**

The spaceship's radio stations, which correspond to specific topics like communicating with Capuccinova, are akin to the `channels` in AsyncAPI. These channels represent paths for sending specific types of messages. Each channel is associated with a particular topic, just as each radio station communicates with a particular planet or star.

```yml
channels:
  chat:
    description: Channel for sending and receiving chat messages
    address: chat/{roomId}
    parameters:
      roomId:
        description: The ID of the chat room
        schema:
          type: string
    send:
      message:
        $ref: '#/components/messages/ChatMessage'
```

- **Tags (Categorizing operations):**

`Tags` in AsyncAPI are like the labels on the spaceship's control panel. They help categorize different operations, making it easier for developers to understand what each part of the API does. Each tag consists of a name and an optional description.

```yml
tags:
  - name: chat
    description: Operations related to chat
```

- **Components (Reusable parts of the API):**

`Component` is like the toolbox in Chan's spaceship. It contains reusable parts like message definitions and schemas that can be used across the API. Each component is linked to a particular schema, which describes the structure of the message content.

```yml
components:
  messages:
    ChatMessage:
      name: ChatMessage
      title: Chat Message
      contentType: application/json
      payload:
        $ref: '#/components/schemas/ChatMessagePayload'
  schemas:
    ChatMessagePayload:
      type: object
      properties:
        userId:
          type: string
          description: The ID of the user who sent the message
        message:
          type: string
          description: The chat message
```

## Programming Operations, Messages, and Schemas

- **Operations (Defined actions within channels):**

`Operations` in AsyncAPI are like the instructions for the spaceship. They define what actions can be performed within each channel, such as sending or receiving messages. Each operation is associated with a message and a schema.

```yml
channels:
  chat:
    description: Channel for sending and receiving chat messages
    address: chat/{roomId}
    parameters:
      roomId:
        description: The ID of the chat room
        schema:
          type: string
    send:
      operationId: sendChatMessage
      summary: Send a chat message
      tags:
        - chat
      message:
        $ref: '#/components/messages/ChatMessage'
```
- **Messages (Content of the operations):**

`Messages` in AsyncAPI are the content exchanged during operations, just like the words Eve from Capuccinova and Chan from Brownieterra use to communicate. They describe the structure and content of the messages sent or received.


```yml
components:
  messages:
    ChatMessage:
      name: ChatMessage
      title: Chat Message
      contentType: application/json
      payload:
        $ref: '#/components/schemas/ChatMessagePayload'
```

- **Schemas (Structure of message content):**

`Schemas` in AsyncAPI are like the blueprints for the spaceship. They define the structure of the message content, ensuring that everything fits together correctly. Each schema is associated with a component and describes the structure and content of the messages.

```yml
components:
  schemas:
    ChatMessagePayload:
      type: object
      properties:
        userId:
          type: string
          description: The ID of the user who sent the message
        message:
          type: string
          description: The chat message
```

### Hands-on Exercise: Guiding Chan's Interstellar Messages to Eve

Chan is determined to improve his messaging capabilities with Eve on Capuccinova. He plans to add a new property for a username and create a new channel for messages. After updating his AsyncAPI document with these new details, Chan faces some issues while trying to validate the changes in AsyncAPI Studio. He needs your help to ensure smooth communication with Eve.

#### Exercise 1: Crafting the Initial Message

Chan is preparing to send his inaugural space message to Eve on Capuccinova and realizes he needs to include a `spacename` in the message format.

**Your Mission:**

1. On the KillerCoda terminal, use the command `nano chan-to-capuccinova.yaml` to edit Chan's AsyncAPI document.

2. Locate the `payload` section under the `ChatMessagePayload` schema. It will look something like this:

   ```yaml
   ChatMessagePayload:
     type: object
     properties:
       userId:
         type: string
         description: The ID of the user who sent the message
       message:
         type: string
         description: The chat message
   ```

3. Insert a new property for the `spacename` within the payload. Your updated payload section should now include:
   ```yaml
   spacename:
     type: string
     description: The unique spacename identifier for the message
   ```

   Ensure that this new property aligns correctly and follows the structure of the existing properties.

4. Save your changes and exit the editor. In Nano, do this by pressing `Ctrl + X`, then `Y` to confirm, and `Enter` to save.

5. Notify Chan that his message structure is updated and he is ready to communicate with Eve on Capuccinova!

### Hands-on Exercise 2: Establishing a New Channel for Messages to Brownieterra

After the successful attempt, Chan is now eager to establish a new communication channel for sending messages to his home planet, Brownieterra. He's unsure about correctly configuring this new channel in his AsyncAPI document and needs your expertise to set up this vital link.

**Your Mission:**

1. Using the KillerCoda terminal, open Chan's AsyncAPI document with the command `nano chan-to-capuccinova.yaml`.

2. Add a new channel for communication with Brownieterra. Locate the `channels` section in the document, which might look something like this:

   ```yaml
   channels:
     chat:
       description: Channel for sending and receiving chat messages
       address: chat/{roomId}
       parameters:
         roomId:
           description: The ID of the chat room
           schema:
             type: string
       send:
         message:
           $ref: '#/components/messages/ChatMessage'
   ```

3. Introduce a new channel entry for Brownieterra. Ensure it includes a suitable description, address, and message structure reference. Your new channel could be structured as follows:
   ```yaml
   brownieterra-chat:
     description: Channel for sending messages to Brownieterra
     address: brownieterra-chat/{spacename}
     parameters:
       spacename:
         description: The unique spacename identifier for Brownieterra communication
         schema:
           type: string
     send:
       message:
         $ref: '#/components/messages/BrownieterraChatMessage'
   ```

   Pay attention to the correct structure and adherence to AsyncAPI specifications.

4. Save the changes in the document by pressing `Ctrl + X`, then `Y` to confirm, and `Enter` to save.

5. Inform Chan that the new channel for communication with Brownieterra is set up in his AsyncAPI document, enabling him to extend his reach beyond Capuccinova!