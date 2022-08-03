import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import Card from "react-bootstrap/Card";
import Table from "react-bootstrap/Table";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";

const Batch = () => {
  let { batchId } = useParams();
  const [batch, setBatch] = useState<any>();
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
        console.log(err);
      });
  };
  return (
    <div>
      {/* <Card style={{ width: '18rem' }}> */}
      <Container fluid="lg">
        <Card>
          {batch ? (
            <Card.Body>
              {/* <Card.Title>{batch.name}</Card.Title> */}
              <Card.Title>{batch.name}</Card.Title>
              <Card.Subtitle className="mb-2 text-muted">
                {batch.description}
              </Card.Subtitle>
              <Card.Text>
                <Container>
                  <Row>
                    <Col>
                    <div dangerouslySetInnerHTML={{ __html: batch.recipe }}/>
                    </Col>
                  </Row>
                  <Row>
                    <Col>Target ABV: {batch.target_abv}</Col>
                  </Row>
                  <Row>
                    <Col>Orignal Gravity: {batch.original_gravity}</Col>
                    <Col>Final Gravity: {batch.final_gravity}</Col>
                  </Row>
                  <Row>
                    <Col>Batch Started On: {batch.pitch_date.slice(0, 10)}</Col>
                  </Row>
                  {batch.notes.length > 0 ? (
                    <Row>
                      <Col>
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
                                <td>{note.date.slice(0, 10)}</td>
                                <td>{note.note}</td>
                              </tr>
                            ))}
                          </tbody>
                        </Table>
                      </Col>
                    </Row>
                  ) : (
                    <Row></Row>
                  )}
                </Container>
              </Card.Text>
              <Card.Link href="/">Back to batch index</Card.Link>
            </Card.Body>
          ) : (
            <p>loading</p>
          )}
        </Card>
      </Container>
    </div>
  );
};

export default Batch;
