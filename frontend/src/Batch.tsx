import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams, Link } from "react-router-dom";
import Card from 'react-bootstrap/Card';
import Table from 'react-bootstrap/Table';

const Batch = () => {
    let { batchId } = useParams();
    const [batch, setBatch] = useState<any>()
    useEffect(() => {
        fetchBatches();
    }, []);
    const fetchBatches = () => {
        axios
            .get(`/api/batches/${batchId}`)
            .then((res) => {
                setBatch(res.data);
            })
            .catch((err) => {
                console.log(err)
            })
    }
    return (     
        <div>
        {/* <Card style={{ width: '18rem' }}> */}
            <Card>
                {batch ? 
                <Card.Body>
                    {/* <Card.Title>{batch.name}</Card.Title> */}
                    <Card.Title>{batch.name}</Card.Title>
                    <Card.Subtitle className="mb-2 text-muted">{batch.description}</Card.Subtitle>
                    <Card.Text>
                        {batch.recipe}
                        <br/>
                        <Table size="sm">
                            <thead>
                                <tr>
                                <th>Date</th>
                                <th>Note</th>
                                </tr>
                            </thead>
                            <tbody>
                            {batch.notes.map((note: any) => (
                                // <p>{note.note}</p>
                                <tr>
                                <td>{note.date}</td>
                                <td>{note.note}</td>
                                </tr>
                            ))}
                            </tbody>
                        </Table>
                    </Card.Text>
                    <Card.Link href="/">Back to batch index</Card.Link>
                </Card.Body>
            : <p>loading</p>}
            </Card>
        </div>
    );
}

export default Batch;