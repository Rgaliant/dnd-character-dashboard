import React from 'react';
import Select from 'react-select';
import get from 'lodash/get';

import SelectService from '../api/SelectService'

// This component should only be used if you know your
// data options are roughly between 0-100. After that, this
// component gets pretty rough since it takes a long time to
// render client side.

// If you know you have options > 100, you should use the
// SearchableSelect component instead
export default class SimpleSelect extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      options: [],
      loading: true
    };
  }

  componentDidMount() {
    SelectService.index(
      this.props.selectData
    ).then(response => {
      const options = response.options.map(data => {
        return {
          label: this.customLabel(data),
          value: data[this.props.optionValue],
          data: data
        };
      });

      this.setState({ options, loading: false });
    });
  }

  customLabel = data => {
    const label = this.props.optionLabel;
    // The options are either string or function
    if (typeof label === 'string') {
      return data[this.props.optionLabel];
    }

    return label(data);
  };

  setDefaultValue = () => {
    const { options } = this.state;
    return this.props.defaultValue(options);
  };

  render() {
    if (this.state.loading) return null;

    const { label, name, placeholder, onSelect, tip, isSearchable } = this.props;

    return (
      <React.Fragment>
        <div style={{ display: 'flex' }}>
          <label className={this.props.required && "required"}>{label}</label>
        </div>
        <Select
          name={name}
          placeholder={placeholder}
          options={this.state.options}
          isSearchable={isSearchable}
          isClearable
          defaultValue={this.setDefaultValue()}
          onChange={option => onSelect(get(option, 'data', {}))}
          styles={{
            menuList: (provided, _state) => ({
              ...provided,
              maxHeight: '125px'
            })
          }}
        />
      </React.Fragment>
    );
  }
}

SimpleSelect.defaultProps = {
  label: 'Select',
  optionLabel: 'name',
  optionValue: 'id',
  placeholder: 'Select...',
  name: 'simple_select',
  selectData: {},
  defaultValue: _options => null,
  onSelect: _data => { },
  isSearchable: false
};