const NewTicket = () => {

    const handleSubmit = (e) =>{
        
        e.preventDefault();//option to put 
        
    }
    return(
        <div className ="create">
        <h1>New Tickets</h1>
            <form onSubmit={handleSubmit}>
                <label>Description:</label>
                    <input 
                    type="text"
                    required
                    />
                <label>Subject:</label>
                    <input 
                    type="text"
                    required
                    />
                <label>Assignee:</label>
                    <input 
                    type="text"
                    required
                    />
                <label>Status:</label>
                    <input 
                    type="text"
                    required
                    />
                <label>Description:</label>
                    <input 
                    type="text"
                    required
                    />
                <label>Tracker:</label>
                    <input 
                    type="text"
                    required
                    />
                <button>Add Ticket</button>
            </form>
        </div>
    )
}

export default NewTicket;