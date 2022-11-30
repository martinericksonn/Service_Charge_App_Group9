import React, { Component } from 'react';
import '../index.css';

 class Dashboard extends Component {
    state = {  } 

    
    render() { 
        return (
          <div className="d-flex flex-row body bg-primary">
          <div className="side-nav bg-info ">
            <div className='d-flex flex-column align-items-center'>
              <h2>Menu</h2>
              <div className='d-flex flex-column '>
              <button className='btn btn-outline-primary'>Home</button>
              <button className='btn btn-outline-primary'>Ticket</button>
              <button className='btn btn-outline-primary'>Settings</button>
              </div>
            </div>
</div>
          </div>
        );
    }
 }
  
 export default Dashboard;