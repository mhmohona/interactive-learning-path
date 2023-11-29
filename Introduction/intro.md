
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
            email:
              type: string
              format: email
            age:
              type: integer
              minimum: 18
```

Here, Chan is planning what to put in his message, like the sender's full name, their email, and their age.

#### How to Send the Message

Last, Chan writes how to send the message:

```
operations: 
  spaceMessage:
    action: send
    channel: 
      $ref: '#/channels/lettertoEarth'
```

This part tells his spaceship to send the message using the `spaceMessage` channel.

### Checking the Document

Chan uses AsyncAPI Studio to make sure his message plan is good. It's like a helper to check for mistakes.

He installs it with `npm install -g @asyncapi/studio` and opens his plan in the studio with `asyncapi studio my-document.yaml`. The studio looks for errors and gives tips.

### Hands-on Exercise

Chan wants to practice more. He thinks about adding a new property for a username and creating a new channel for messages to Mars. He updates his document with these new details and then uses AsyncAPI Studio to validate his changes.

#### Expected Outcome

After following these steps, Chan should be able to see his updated document in the AsyncAPI Studio. The studio should validate the document and show any errors or warnings.
