import React, { useState } from 'react'
import './Clock.css'

function Clock() {

  const [count, setCount] = useState(0);

  return (
    <div>
        <h1> You clicked {count} time! </h1>
        <button onClick={() => setCount(count + 1)} className="_button">Click here please!</button>
    </div>
  )
}

export default Clock;
