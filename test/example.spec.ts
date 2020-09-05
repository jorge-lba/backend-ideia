import test from 'japa'
import supertest from 'supertest'
import Env from '@ioc:Adonis/Core/Env'

const BASE_URL = `http://${process.env.HOST}:${process.env.PORT}`

test.group('Welcome', () => {
  test('ensure home page works', async (assert) => {
    /**
     * Make request
     */
    const { body } = await supertest(BASE_URL)
      .get('/')
      .expect(200)
    console.log('result: ', body)
    /**
     * Construct JSDOM instance using the response HTML
     */
    const hello = body?.hello
    assert.exists(hello)
    assert.equal(hello, 'world')
  })
})
