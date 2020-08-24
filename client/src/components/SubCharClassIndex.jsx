import React, { useState, useEffect } from 'react'
import Axios from 'axios'
import { List, Card } from 'semantic-ui-react'

const SubCharClasses = () => {
    const [subCharClasses, setSubCharClasses] = useState({})

    useEffect(() => {
        Axios.get('/api/v1/sub_char_classes').then(response => setSubCharClasses(response.data))
    }, [])
    console.log(subCharClasses)
    return {
        subCharClasses
    }
}

const SubCharClassIndex = () => {
    const { subCharClasses } = SubCharClasses();

    return (
        <Card.Group centered>
            {subCharClasses.length > 0 && subCharClasses.map(cc => {
                return (
                    <Card>
                        <Card.Content header={cc.name} />
                        <Card.Content description={cc.desc} />
                    </Card>
                )
            })}
        </Card.Group>
    )
}

export default SubCharClassIndex