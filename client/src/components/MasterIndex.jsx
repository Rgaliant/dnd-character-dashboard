import React, { useState, useEffect } from 'react'
import CharClassIndex from './CharClassIndex'
import SubCharClassIndex from './SubCharClassIndex'
import Modal from 'react-modal'

const MasterIndex = () => {
    const [charClassModalIsOpen, setCharClassOpen] = React.useState(false);
    const [subCharClassModalIsOpen, setSubCharClassOpen] = React.useState(false);

    function openModal(modalOption) {
        switch (modalOption) {
            case "CharClass":
               return setCharClassOpen(true);
            case "SubCharClass":
                return setSubCharClassOpen(true);
            default:
                return setCharClassOpen(true)
        }
    }

    function closeModal(modalOption) {
        switch (modalOption) {
            case "CharClass":
               return setCharClassOpen(false);
            case "SubCharClass":
                return setSubCharClassOpen(false);
            default:
                return setCharClassOpen(false)
        }
    }

    function closeCharClassModal() {
        setCharClassOpen(false);
    }
    function closeSubCharClassModal() {
        setSubCharClassOpen(false);
    }

    return (
        <>
            <h1>This is the index of the current database</h1>
            <div style={{ display: 'flex', justifyContent: 'space-evenly' }}>
                <button onClick={() => openModal("CharClass")}>Classes</button>
                <Modal
                    isOpen={charClassModalIsOpen}
                    onRequestClose={() => closeModal("CharClass")}
                    contentLabel="Example Modal"
                >
                    <CharClassIndex />
                </Modal>
                <button onClick={() => openModal("SubCharClass")}>SubClasses</button>
                <Modal
                    isOpen={subCharClassModalIsOpen}
                    onRequestClose={() => closeModal("SubCharClass")}
                    contentLabel="Example Modal"
                >
                    <SubCharClassIndex />
                </Modal>
            </div>
        </>
    )
}

export default MasterIndex