import React, { useState } from 'react';
// 1. import `NextUIProvider` component
import { NextUIProvider, Card, Text, Col, Grid, Row, Button } from "@nextui-org/react";
import Clock from "./Clock";
//= require components/Clock
//= require components/CardList

function KNApplication() {

  const [count, setCount] = useState(0);

  return (
    <div className="KNApplication">
        <Clock />
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

// function Clock() {

//     const [count, setCount] = useState(0);

//     return (
//         <div>
//             <h1> You clicked {count} time! </h1>
//             <button onClick={() => setCount(count + 1)} className="_button">Click</button>
//         </div>
//     )
// }

function EventCard(props) {
    return (
      <Card css={{ w: "100%", h: "400px", "box-shadow": "0 4px 2px #ccc" }}>
        <Card.Header css={{ position: "absolute", zIndex: 1, top: 5 }}>
          <Col>
            <Text size={12} weight="bold" transform="uppercase" color="#ffffffAA">
            {props.name}
            </Text>
            <Text h3 color="black">
            {props.desc}
            </Text>
          </Col>
        </Card.Header>
        <Card.Body css={{ p: 0 }}>
          <Card.Image
            src="https://nextui.org/images/card-example-6.jpeg"
            width="100%"
            height="100%"
            objectFit="cover"
            alt="Card example background"
          />
        </Card.Body>
        <Card.Footer
          isBlurred
          css={{
            position: "absolute",
            bgBlur: "#ffffff66",
            borderTop: "$borderWeights$light solid rgba(255, 255, 255, 0.2)",
            bottom: 0,
            zIndex: 1,
          }}
        >
          <Row>
            <Col>
              <Text color="#000" size={12}>
                Available soon.
              </Text>
              <Text color="#000" size={12}>
                Get notified.
              </Text>
            </Col>
            <Col>
              <Row justify="flex-end">
                <Button flat auto rounded color="secondary">
                  <Text
                    css={{ color: "inherit" }}
                    size={12}
                    weight="bold"
                    transform="uppercase"
                  >
                    Notify Me
                  </Text>
                </Button>
              </Row>
            </Col>
          </Row>
        </Card.Footer>
      </Card>
    );
  }

function CardList() {
    return (
      <Grid.Container gap={2} justify="center">
        <Grid xs={12} sm={3}>
          <EventCard name="Jesus" desc="This one is the Lord of Lords"/>
        </Grid>
        <Grid xs={12} sm={3}>
        <EventCard name="Peter" desc="Received the keys of the Kingdom"/>
        </Grid>
        <Grid xs={12} sm={3}>
          <EventCard name="John" desc="The beloved disciple"/>
        </Grid>
        <Grid xs={12} sm={3}>
          <EventCard name="Paul" desc="The apostle to the nations"/>
        </Grid>
        <Grid xs={12} sm={5}>
          <EventCard name="Jesus" desc="This one is the Lord of Lords"/>
        </Grid>
        <Grid xs={12} sm={7}>
          <EventCard name="Patrice" desc="This one is just a redeemed of the Lord"/>
        </Grid>
        <Grid xs={12} sm={4}>
          <EventCard name="Paul" desc="The apostle to the nations"/>
        </Grid>
        <Grid xs={12} sm={4}>
          <EventCard name="Jesus" desc="This one is the Lord of Lords"/>
        </Grid>
        <Grid xs={12} sm={4}>
          <EventCard name="Patrice" desc="This one is just a redeemed of the Lord"/>
        </Grid>
      </Grid.Container>
    );
  }

export default App;
