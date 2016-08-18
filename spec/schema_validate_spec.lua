--luacheck: ignore describe it
describe('rapidjson.schema_validate()', function()
  local rapidjson = require('rapidjson')

  simple_valid_schema = [[
    {
    "$schema": "http://json-schema.org/draft-04/schema#",
    "type": "object",
    "properties": { "q": { "type": "string" } },
    "required": [ "q" ]
    }
  ]]

  simple_invalid_schema = [[
    {
    "$schema": "http://json-schema.org/draft-04/schema#",
    "type": "object",
    "properties": { "q": { "type": "string" } },
    "required": [ "q" ]
  ]]

  it('should properly validate against a simple schema', function()
    t = rapidjson.schema_validate(simple_valid_schema, '{"q": "blah"}')
    assert.are.equal(t['q'], 'blah')

    -- shouldn't validate -- `q` is not a string
    t = rapidjson.schema_validate(simple_valid_schema, '{"q": 3}')
    assert.is_not_table(t)
    assert.is_not_true(t)
  end)

  it('should raise an error when the document is invalid JSON', function()
    assert.has_error(function()
      rapidjson.schema_validate(simple_valid_schema, '{"q":}')
    end)
  end)

  it('should raise an error when the schema is invalid JSON', function()
    assert.has_error(function()
      rapidjson.schema_validate(simple_invalid_schema,'{"q":"blah"}')
    end)
  end)
end)
