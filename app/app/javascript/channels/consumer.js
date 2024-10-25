import { createConsumer } from "@rails/actioncable";

const consumer = createConsumer();  // Initializes the WebSocket connection

export default consumer;