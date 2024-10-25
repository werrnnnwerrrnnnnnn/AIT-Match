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
          const messagesElement = document.getElementById("messages");
          messagesElement.insertAdjacentHTML('beforeend', `
            <div class="message">
              <p><strong>${data.profile}:</strong> ${data.message}</p>
              <small>${data.created_at}</small>
            </div>
          `);
        }
      }
    );
  } else {
    console.log("No conversation ID found.");
  }
});