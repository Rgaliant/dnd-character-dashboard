import axios from 'axios';

function index(params) {
    return axios.get('/selects', {params: {
        model: params.model
    }}).then(response => {
        return new Promise(resolve => {
            resolve(response.data)
        })
    })
}

const SelectService = {
    index
}

export default SelectService