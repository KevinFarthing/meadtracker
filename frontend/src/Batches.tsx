import axios from 'axios';
import React, { useState, useEffect } from 'react';
import { Link } from "react-router-dom";
import Card from 'react-bootstrap/Card';
import Col from 'react-bootstrap/Col';
import ListGroup from 'react-bootstrap/ListGroup';
import Row from 'react-bootstrap/Row';
import Tab from 'react-bootstrap/Tab';

const Batches = () => {
    const [batches, setBatches] = useState<any[]>([])
    useEffect(() => {
        fetchBatches();
    }, []);
    const fetchBatches = () => {
        axios
            .get('/api/batches')
            .then((res) => {
                setBatches(res.data);
            })
            .catch((err) => {
                console.log(err)
            })
    }
    return (
        <Tab.Container id="list-group-tabs-example" defaultActiveKey="#batch1">
        <Row>
          <Col sm={4}>
            <ListGroup>
                {batches.map((batch) => (
                    <ListGroup.Item action href={`#batch${batch.id}`}>
                            {/* <Link to={`/batch/${batch.id}`}>{batch.name}</Link><br/> */}
                            <p>{batch.id}</p>
                    </ListGroup.Item>
                ))}
            </ListGroup>
          </Col>
          <Col sm={4}>
            <Tab.Content>
                {batches.map((batch) => (
                    <Tab.Pane eventKey={`#batch${batch.id}`}>
                            <Link to={`/batch/${batch.id}`}>
                                {batch.name}
                            </Link>
                    </Tab.Pane>
                ))}
            </Tab.Content>
          </Col>
          <Col sm={4}>
            <Tab.Content>
                {batches.map((batch) => (
                    <Tab.Pane eventKey={`#batch${batch.id}`}>
                            <p>{batch.description}</p>
                    </Tab.Pane>
                ))}
            </Tab.Content>
          </Col>
        </Row>
      </Tab.Container>
    );
}

export default Batches;