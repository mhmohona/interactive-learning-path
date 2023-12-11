When Chan has to go back to his planet, he wants to keep talking to Eve. Eve is a bit sad that Chan is leaving, but she's also excited to try sending messages across space. They decide that Chan will learn to write AsyncAPI documents so they can stay in touch.

### Writing an AsyncAPI Document

#### Starting Simple

Chan begins by setting up his space message plan. He writes:

```
asyncapi: 3.0.0
info:
  title: Sending Signal to Eve
  version: 0.1.0
```

This is like Chan saying, "I'm using the `3.0.0` space message rules, and I'm naming my plan `Sending Signal to Eve.`".

#### Making a Message Route

Next, Chan picks a path for his message. He makes a channel called `spaceMessage` with the address `Earth/letter`. Now his plan looks like this:

```
channels:
  spaceMessage:
    address: Earth/letter
    messages:
      lettertoEarth:
        description: Communicating with Eve.
        payload:
          type: object
          additionalProperties: false
          properties:
            fullName:
              type: string
            age:
              type: integer
              minimum: 18
```

Here, Chan is planning what to put in his message, like the sender's full name, and their age.

#### How to Send the Message

Last, Chan writes how to send the message:

```
operations: 
  spaceMessage:
    action: send
    channel: 
      $ref: '#/channels/spaceMessage'
```

This part tells his spaceship to send the message using the `spaceMessage` channel.

### Checking the Document

Chan uses AsyncAPI Studio to make sure his message plan is good. It's like a helper to check for mistakes.

He installs it with `npm install -g @asyncapi/studio` and opens his plan in the studio with `asyncapi studio my-document.yaml`. The studio looks for errors and gives tips.

He also uses the Web version of [AsyncAPI Studio](https://studio.asyncapi.com/) where he can simply paste his document and be able to check if he has any error there.

###  Hands-on Exercise: Guiding Chan's Interstellar Messages to Eve

Chan wants to practice more. He thinks about adding a new property for a username and creating a new channel for messages to Mars. He updates his document with these new details and then uses AsyncAPI Studio to validate his changes. But he seems to have problem!  He needs your help to comminicate with Eve.

#### Exercise 1: Crafting the Initial Message

Chan is ready to send his first space message to Eve, but he needs to include a `spacename` in the message format.

**Your Mission:**

1. Open the terminal and use the command `nano chan-to-eve.yaml` to edit Chan's draft.
2. In the payload section, insert a new property for the `spacename`:

   ```yaml
   spacename:
     type: string
   ```

3. Save and exit the editor. Let Chan know his message structure is set!

#### Exercise 2: Fixing Communication Errors

Chan's message plan has some errors that are preventing it from being sent correctly.

**Your Mission:**

1. Use `nano chan-message-errors.yaml` in the terminal to open the file with errors.
2. Identify and correct any YAML syntax errors or missing fields.
3. Save your corrections and inform Chan that his message path is now clear.

#### Exercise 3: Customizing the Message for Eve

Chan wishes to make his messages more personal with timestamps and priority levels.

**Your Mission:**

1. Reopen `chan-to-eve.yaml` in the terminal.
2. Add the message payload with `timestamp` and `priority` fields:
   ```yaml
   timestamp:
     type: string
     format: date-time
   priority:
     type: integer
   ```
   
3. Save the file and show Chan how his messages to Eve will now carry these unique details.

#### Exercise 4: Expanding Communication Channels

Chan is eager to extend his communication network to a friend on Mars.

**Your Mission:**
1. Create a new file `chan-to-mars.yaml` using the terminal.
2. Define a `marsMessage` channel with unique properties and an address.
3. After saving, use AsyncAPI Studio to validate the new Martian message route and update Chan on your success.

Certainly! Here's an additional exercise focusing on the "How to Send the Message" aspect for the `chan-to-mars.yaml` file.

### Exercise 5: Defining the Message Sending Protocol for Mars Communication

Now that Chan has set up the basic structure for communicating with Mars, he needs to define the specifics of how the messages will be sent and received. This involves specifying the operations for the `marsMessage` channel in his AsyncAPI document.

**Your Mission:**

1. Open `chan-to-mars.yaml` using the terminal command `nano chan-to-mars.yaml`.
2. Add the operations section to define how messages will be sent to and received from Mars. You might structure it like this:

   ```yaml
   operations:
     marsMessage:
       action: send
       channel:
         $ref: '#/channels/marsMessage'
   ```

3. Save and exit the editor. Let Chan know that his Mars communication protocol is now defined!

#### Final Step:

After completing this task, use AsyncAPI Studio to validate the updated `chan-to-mars.yaml` document to ensure everything is set up correctly for interplanetary communication.

#### Review and Intergalactic Comparison:
Compare your final AsyncAPI documents with Chan's original ideas to understand different communication strategies in the cosmos and solidify your understanding of AsyncAPI.