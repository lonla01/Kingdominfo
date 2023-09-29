import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import App from "../components/App";
import CardList from "../components/CardList";

export default (
  <Router>
    <Routes>
      <Route path="/" exact component={App} />
      <Route path="/events" element={<CardList />} />
    </Routes>
  </Router>
);
