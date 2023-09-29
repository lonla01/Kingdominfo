import { Grid } from "@nextui-org/react";
import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import EventCard from "./EventCard.jsx"

function CardList() {

    // const navigate = useNavigate();
    const [events, setEvents] = useState([]);
    const targetUrl = "http://127.0.0.1:3000/en/events.json";

    useEffect(() => {
      fetch( targetUrl, {method: 'GET'} )
        .then((response) => {
          if (response.ok) {
            let res_json = response.json();
            console.log( "Response: [" + res_json + "]" );
            return res_json;
          }
          throw new Error( response );
        })
        .then((jsonArray) => {
          setEvents(jsonArray);
        });

        // .catch(() => navigate("/"));
    }, []);

    console.log( "Fetched_Events: [" + events + "]" );
    let grid_index = 0;
    const allGrids = events.map( (event, index) => (
      <Grid xs={12} sm={3} key={grid_index++}>
          <EventCard name={event.event_organizer} desc={event.title} key={event.id} />
      </Grid>
    ) );

    return (
      <Grid.Container gap={2} justify="center">
        { allGrids }
      </Grid.Container>
    );
  }

  export default CardList;
