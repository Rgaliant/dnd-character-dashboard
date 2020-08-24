import React from 'react'
import { Link } from 'react-router-dom'
import styled from 'styled-components'

const NavBox = styled.ul`
    display: flex;
    flex-direction: row;
    list-style: none;
    width: 100%;
    justify-content: space-evenly;
    background: #0C154A;
    margin-top: 0px;
`

const NavItem = styled.li`
    padding: 10px;
`

const NavLink = styled(Link)`
    text-decoration: none;
    color: #F2F2F2;
`

export default class Navbar extends React.Component{
    render() {
        return (
            <div>
              <NavBox>
                <NavItem><NavLink to="/">Home</NavLink></NavItem>
                <NavItem><NavLink to="/master-index">Index</NavLink></NavItem>
                <NavItem><NavLink to="#">Session</NavLink></NavItem>
                <NavItem><NavLink to="#">DM</NavLink></NavItem>
              </NavBox>
            </div>
        );
    }
}