namespace definitions;


({
  definitions: {
    Name:     { type : cds.String },  // No quotes around cds.String
    Currency: { type: cds.String, length: 3 },
    USD:      { type: Currency },    // Currency type should be defined elsewhere in the model
    Amount:   { 
      elements: {
        value:    { type: cds.Decimal, precision: 11, scale: 3 },
        currency: { type: Currency },  // Ensure Currency is defined or is a known type
      }
    },
    SortOrder: { enum: { asc: {}, desc: {} } }
  }
})

