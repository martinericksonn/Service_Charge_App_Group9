const NewTicket = () => {
    return(
        <div className ="create">
        <h1>New Tickets</h1>
            <form>
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
                <label>Tracker:</label>
                    <input 
                    type="text"
                    required
                    />
            </form>
        </div>
    )
}

export default NewTicket;