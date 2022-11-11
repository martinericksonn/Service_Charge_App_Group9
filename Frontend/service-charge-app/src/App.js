import logo from './logo.svg';
import './App.css';
import TicketManagement from './Components/TicketManagement';
import Dashboard from './Components/Dashboard';
import Sidebar from './Components/sidebar/Sidebar';

function App() {
    return ( 
      <div>
        <Sidebar/>
        <Dashboard/>
      </div>
    );
}

export default App;