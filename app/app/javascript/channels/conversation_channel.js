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

          // Convert the timestamp to Bangkok timezone before appending
          const formattedTime = new Date(data.created_at).toLocaleString('en-GB', {
            timeZone: 'Asia/Bangkok',
            hour: '2-digit',
            minute: '2-digit',
            day: '2-digit',
            month: 'short',
            year: 'numeric'
          });

          // Update the messages section with the new message
          const messagesElement = document.getElementById("messages");
          messagesElement.insertAdjacentHTML('beforeend', `
            <div class="message" id="message-${data.id}">
              <p><strong>${data.profile}:</strong> ${data.message}</p>
              <small>Sent at: ${formattedTime}</small>
            </div>
          `);
        }
      }
    );
  } else {
    console.log("No conversation ID found.");
  }
});