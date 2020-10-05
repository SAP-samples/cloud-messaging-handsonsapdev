module.exports = async srv => {

  const messaging = await cds.connect.to('messaging')

  srv.on('send', req => {

    messaging.tx(req).emit({
      event: 'firsttopic',
      data: { number: 42 },
      headers: {}
    })

    return 'OK'

  })

  messaging.on('secondtopic', msg => {

    console.log(`☞ ${JSON.stringify(msg)}`)

  })


}
