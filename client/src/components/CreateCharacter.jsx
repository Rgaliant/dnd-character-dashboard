import React, { useState, useEffect } from 'react'
import Select from 'react-select';
import RaceSelect from './RaceSelect';
import CharClassSelect from './CharClassSelect';
import SubCharClassSelect from './SubCharClassSelect';

const genderOptions = [
  { value: 'male', label: 'Male' },
  { value: 'female', label: 'Female' }
]

const CreateCharacter = () => {
  const [name, setName] = useState("");
  const [backstory, setBackstory] = useState("")
  const [gender, setGender] = useState("")
  const [race, setRace] = useState("")
  const [charClass, setCharClass] = useState("")
  const [subCharClass, setSubCharClass] = useState("")

  const handleSubmit = e => {
    e.preventDefault();
    alert(`submitting name ${name}`)
  }
  return (
    <div style={{ display: 'flex', flexDirection: 'column' }}>
      <label>Name:
            <input type="text" value={name} onChange={e => setName(e.target.value)} />
      </label>
      <label>Backstory:
            <input type="text" value={backstory} onChange={e => setBackstory(e.target.value)} />
      </label>
      <div style={{ display: 'flex' }}>
        <label>Gender</label>
      </div>
      <Select options={genderOptions} label={'Gender'} onChange={e => setGender(e)} />
      <RaceSelect onChange={e => setRace(e)} />
      <CharClassSelect onChange={e => setCharClass(e)} />
      <SubCharClassSelect onChange={e => setSubCharClass(e)} />
      <input type="submit" value="Submit" />
    </div>
  )
}

export default CreateCharacter;