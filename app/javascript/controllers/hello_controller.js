import { Controller } from "@hotwired/stimulus"
import React from "react";
import { createRoot } from "react-dom/client";
import App from "../components/App";

export default class extends Controller {
  connect() {
    console.log("Greetings from Hello Controller!");
    this.element.textContent = "Hello World!"
  }
}

document.addEventListener("DOMContentLoaded", () => {
  console.log("2. Hello from hello controller!");
  const app = document.getElementById("react_root");
  createRoot(app).render(<App />);
});
