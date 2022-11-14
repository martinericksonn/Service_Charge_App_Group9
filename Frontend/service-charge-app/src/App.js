import './App.css';
import TicketManagement from './Components/TicketManagement';
import Navbar from './Components/Navbar';
import TicketList from './pages/TicketList';
import NewTicket from './pages/NewTicket';
import Notification from './pages/Notification';
import Attachments from './pages/Attachments';
import ViewTicket from './pages/ViewTicket';

function App() {
    let component
    switch (window.location.pathname) {
        case "/":
            component=<App/>
            break;
        case "/Ticket_List":
            component= <TicketList/>
            break;
        case "/New_Ticket":
            component= <NewTicket/>
            break;
        case "/Notification":
            component= <Notification/>
            break;
        case "/Attach_Files":
            component= <Attachments/>
            break;
        case "/View_Tickets":
            component= <ViewTicket/>
            break;
    }

    return ( 
        <>
        <Navbar/>
        <div className="container">{component}</div>
        </>
    );
}

export default App;