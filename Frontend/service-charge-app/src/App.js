import './App.css';
import TicketManagement from './Components/TicketManagement';
import Navbar from './Components/Navbar';
import TicketList from './pages/TicketList';
import NewTicket from './pages/NewTicket';
import Notification from './pages/Notification';
import Attachments from './pages/Attachments';
import ViewTicket from './pages/ViewTicket';
import {Route, Routes} from "react-router-dom"

function App() {

    return ( 
        <>
        <Navbar/>
        <div className="container">
            <Routes>
                <Route path='/Home' element={<App/>}/>
                <Route path='/Ticket_List' element={<TicketList/>}/>
                <Route path='/New_Ticket' element={<NewTicket/>}/>
                <Route path='/Notification' element={<Notification/>}/>
                <Route path='/attach_Files' element={<Attachments/>}/>
                <Route path='/view_Tickets' element={<ViewTicket/>}/>
            </Routes>
        </div>
        </>
    );
}

export default App;