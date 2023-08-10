import { Grid } from "@nextui-org/react";

import './EventCard.jsx';


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

  export default CardList;
