import axios from "axios";
import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import Card from "react-bootstrap/Card";
import Container from "react-bootstrap/Container";
import Table from "react-bootstrap/Table";

const Batches = () => {
  const navigate = useNavigate();
  const goBatchPage = (batchId :bigint) => {
   navigate(`/batch/${batchId}`);
}

  const [batches, setBatches] = useState<any[]>([]);
  useEffect(() => {
    fetchBatches();
  }, []);
  const fetchBatches = () => {
    axios
      .get("/api/batches")
      .then((res) => {
        setBatches(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };
  return (
    <div>
      <Container fluid="lg">
        <Card>
          <Card.Body>
            {/* <Card.Title>{batch.name}</Card.Title> */}
            <Card.Title>Kevin's Mead Journal</Card.Title>
            <Card.Text>
              <Table size="sm" bordered hover>
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Batch Name</th>
                    <th>Batch Description</th>
                  </tr>
                </thead>
                <tbody>
                  {batches.map((batch) => (
                    <tr key={batch.id} onClick={() => goBatchPage(batch.id)} style={{cursor: "pointer"}}>
                        <td>{batch.id}</td>
                        <td>{batch.name}</td>
                        <td>{batch.description}</td>
                    </tr>
                  ))}
                </tbody>
              </Table>
            </Card.Text>
          </Card.Body>
        </Card>
      </Container>
    </div>
  );
};

export default Batches;
