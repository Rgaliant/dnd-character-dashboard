import React, { useState, useEffect } from 'react'
import CharClassService from '../api/CharClassService'
import Axios from 'axios'

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
const MasterIndex = () => {
    const { charClasses } = CharClasses();

    return (
        <>
            <h1>This is the index of the current database</h1>
            <h2>Classes</h2>
            <ul>
                {charClasses.length > 0 && charClasses.map(cc => {
                    return(
                    <li><p>{cc.name}</p></li>
                    )
                })}
            </ul>
            <h2>SubClasses</h2>
            <ul>
                {/* {subCharClasses.length > 0 && subCharClasses.map(cc => {
                    return(
                    <li><p>{cc.name}</p></li>
                    )
                })} */}
            </ul>
        </>
    )
}

export default MasterIndex