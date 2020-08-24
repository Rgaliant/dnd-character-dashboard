import axios from 'axios';

function index() {
    return axios.get('/api/v1/char_classes').then(response => {
        return new Promise(resolve => {
            resolve(response.data)
        })
    })
}

const CharClassService = {
    index
}

export default CharClassService