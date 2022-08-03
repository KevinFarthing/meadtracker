import { useState, useEffect } from 'react'
import Batch from './Batch'
import Batches from './Batches'
// import reactLogo from './assets/react.svg'
import './App.css'

import { BrowserRouter, Link, Routes, Route } from 'react-router-dom';

// const style = {display: 'flex', gap: '8px', padding: '8px'
const style = {}

function App() {
  // useEffect(() => {
  //   if (window.location.pathname === '/') {
  //     window.location.replace('/app');
  //   }
  // }, []);

  return (
    // <BrowserRouter basename="app">
    <BrowserRouter>
      {/* <nav style={style}>
        <Link to="/">All Batches</Link>
        <Link to="/batch">Batch Page</Link><br/>
      </nav> */}
      <Routes>
        <Route path="/" element={<Batches/>}/>
        <Route path="/batch/:batchId" element={<Batch/>}/>
      </Routes>
    </BrowserRouter>
  );
}

// function SettingsPage() {
//   return(
//     <div>
//     <h1>Settings Page</h1>
//     <ul>
//       <li>My profile</li>
//       <li>Music</li>
//       <li>About</li>
//     </ul>
//   </div>
//   );
// }

// function HomePage() {
//   const style = {padding: '8px'}
//   // <div style={style}>
//   return(
//     <div>
//     <h1>React TS Home</h1>
//     <p>Welcome to the homepage</p>
//   </div>
//   );
// }

export default App
