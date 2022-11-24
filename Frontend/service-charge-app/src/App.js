import { useState } from 'react'; import './App.css';
// import TicketManagement from './Components/TicketManagement';
import LogIn from './Components/LogIn';
// import Navbar from './Components/Navbar';
// import TicketList from './pages/TicketList';
// import NewTicket from './pages/NewTicket';
// import Notification from './pages/Notification';
// import Attachments from './pages/Attachments';
// import ViewTicket from './pages/ViewTicket';
// import Home from './pages/Home';
// import {Route, Routes} from "react-router-dom"
import { Login } from './Components/LoginScreen';


function App() {
    const [currentForm, setCurrentForm] = useState ('login');
    return ( 
        <>
        <LogIn/>
        {/* <Navbar/> */}
        {/* <div className="container">
            <Routes>
                <Route path='/Home' element={<Home/>}/>
                <Route path='/Ticket_List' element={<TicketList/>}/>
                <Route path='/New_Ticket' element={<NewTicket/>}/>
                <Route path='/Notification' element={<Notification/>}/>
                <Route path='/attach_Files' element={<Attachments/>}/>
                <Route path='/view_Tickets' element={<ViewTicket/>}/>
            </Routes>
        </div>  */}
        </>
    );
}

export default App;