import React, { useState } from 'react';
// 1. import `NextUIProvider` component
import { NextUIProvider, Card, Text, Col, Grid, Row, Button } from "@nextui-org/react";
import CardList from "./CardList"

function KNApplication() {

  const [count, setCount] = useState(0);

  return (
    <div className="KNApplication">
        <CardList />
    </div>
  )
}

function App() {
  // 2. Wrap NextUIProvider at the root of your app
  return (
    <NextUIProvider>
      <KNApplication />
    </NextUIProvider>
  );
}

export default App;
