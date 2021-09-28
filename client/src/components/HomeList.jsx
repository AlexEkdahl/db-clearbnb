import React, { useState, useEffect } from 'react'
import HomeCard from './HomeCard'

import { getHomeList } from '../api/homeApi'

const HomeList = () => {
  const [homes, setHomes] = useState([])
  const [price, setPrice] = useState(100)
  const [startDate, setStartDate] = useState('')
  const [endDate, setEndDate] = useState('')
  const [input, setInput] = useState()
  const [wifi, setWifi] = useState(false)
  const [bath, setBath] = useState(false)
  const [kitchen, setKitchen] = useState(false)
  const [parking, setParking] = useState(false)

  useEffect(() => {
    async function getHomes() {
      let query = price ? `?price=${price}` : ''
      query +=
        startDate && endDate
          ? `&start_date=${convertDate(startDate)}&end_date=${convertDate(
              endDate
            )}`
          : ''
      query = amenitiesFilter(query)
      query += input ? `&search=${input}` : ''
      console.log('query :>> ', query)
      const homeList = await getHomeList(query)
      setHomes(homeList)
    }
    const timer = setTimeout(() => {
      getHomes()
    }, 300)
    return () => clearTimeout(timer)
  }, [price, startDate, endDate, input, wifi, kitchen, parking, bath])

  function amenitiesFilter(query) {
    if (bath) {
      query += '&amenity=BATH'
    }
    if (parking) {
      query += '&amenity=PARKING'
    }
    if (kitchen) {
      query += '&amenity=KITCHEN'
    }
    if (wifi) {
      query += '&amenity=WIFI'
    }

    return query
  }

  const convertDate = (dateString) => {
    var p = dateString.split(/\D/g)
    return [p[2], p[1], p[0]].join('/')
  }

  return (
    <>
      <input
        type='range'
        v-model='range'
        min='0'
        max='15000'
        step='10'
        onMouseUp={(e) => {
          e.preventDefault()
          setPrice(e.target.value)
        }}
      />
      <h5>max price: {price}</h5>

      <input
        type='date'
        name='startDate'
        value={startDate}
        onChange={(e) => {
          e.preventDefault()

          setStartDate(e.target.value)
        }}
      />

      <input
        type='date'
        name='endDate'
        value={endDate}
        onChange={(e) => {
          setEndDate(e.target.value)
        }}
      />
      <input
        type='text'
        name='search'
        value={input}
        onChange={(e) => {
          setInput(e.target.value)
        }}
      />
      <div>
        <input
          type='checkbox'
          value='WIFI'
          onChange={(e) => {
            Array.from(
              document.querySelectorAll('input[type=checkbox]')
            ).forEach((el) => {
              if (e.target !== el) {
                el.checked = false
                setBath(false)
                setKitchen(false)
                setParking(false)
              }
            })
            if (e.target.checked) {
              setWifi(true)
            } else {
              setWifi(false)
            }
          }}></input>
        <span>WIFI</span>
        <input
          type='checkbox'
          value='KITCHEN'
          onChange={(e) => {
            Array.from(
              document.querySelectorAll('input[type=checkbox]')
            ).forEach((el) => {
              if (e.target !== el) {
                el.checked = false
                setBath(false)
                setWifi(false)
                setParking(false)
              }
            })
            if (e.target.checked) {
              setKitchen(true)
            } else {
              setKitchen(false)
            }
          }}></input>
        <span>KITCHEN</span>
        <input
          type='checkbox'
          value='BATH'
          onChange={(e) => {
            Array.from(
              document.querySelectorAll('input[type=checkbox]')
            ).forEach((el) => {
              if (e.target !== el) {
                el.checked = false
                setWifi(false)
                setKitchen(false)
                setParking(false)
              }
            })
            if (e.target.checked) {
              setBath(true)
            } else {
              setBath(false)
            }
          }}></input>
        <span>BATH</span>
        <input
          type='checkbox'
          value='PARKING'
          onChange={(e) => {
            Array.from(
              document.querySelectorAll('input[type=checkbox]')
            ).forEach((el) => {
              if (e.target !== el) {
                el.checked = false
                setBath(false)
                setKitchen(false)
                setWifi(false)
              }
            })
            if (e.target.checked) {
              setParking(true)
            } else {
              setParking(false)
            }
          }}></input>
        <span>PARKING</span>
      </div>
      {homes && homes.map((home) => <HomeCard home={home} key={home.id} />)}
    </>
  )
}

export default HomeList
