import consumer from "./consumer";

document.addEventListener("turbo:load", () => {
  const conversationElement = document.getElementById("conversation-id");

  if (conversationElement) {
    const conversationId = conversationElement.dataset.conversationId;

    console.log("Attempting to subscribe to ConversationChannel with ID: " + conversationId);

    consumer.subscriptions.create(
      { channel: "ConversationChannel", conversation_id: conversationId },
      {
        connected() {
          console.log("Connected to ConversationChannel with ID: " + conversationId);
        },

        disconnected() {
          console.log("Disconnected from ConversationChannel with ID: " + conversationId);
        },

        received(data) {
          console.log("Received data:", data);

          // Use the formatted timestamp directly from the server
          const formattedTime = data.created_at; // Directly use the formatted string received

          // Update the messages section with the new message
          const messagesElement = document.getElementById("messages");
          messagesElement.insertAdjacentHTML('beforeend', `
            <div class="message" id="message-${data.id}">
              <p><strong>${data.profile}:</strong> ${data.message}</p>
              <small>Sent at: ${formattedTime}</small> <!-- This will now show the correct format -->
            </div>
          `);
        }
      }
    );
  } else {
    console.log("No conversation ID found.");
  }
});