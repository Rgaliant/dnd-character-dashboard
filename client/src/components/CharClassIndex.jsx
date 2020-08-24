import React, { useState, useEffect } from 'react'
import Axios from 'axios'
import { List } from 'semantic-ui-react'

const CharClasses = () => {
    const [charClasses, setCharClasses] = useState({})

    useEffect(() => {
        Axios.get('/api/v1/char_classes').then(response => setCharClasses(response.data))
    }, [])
    console.log(charClasses)
    return {
        charClasses
    }
}

const CharClassIndex = () => {
    const { charClasses } = CharClasses();

    return (
        <List>
            {charClasses.length > 0 && charClasses.map(cc => {
                return (
                    <List.Item>
                        <List.Content>
                            <List.Header>{cc.name}</List.Header>
                            <List.Description>{cc.desc}</List.Description>
                        </List.Content>
                    </List.Item>

                )
            })}
        </List>
    )
}

export default CharClassIndex