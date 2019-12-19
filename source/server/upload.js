const IncomingForm = require("formidable").IncomingForm
const fs = require("fs")
const path = require("path")
const uploadDir = path.join(__dirname, "/files/") //i made this  before the function because i use it multiple times for deleting later
const AWS = require("aws-sdk")
const s3 = new AWS.S3({
  accessKeyId: "AKIA5CO7LCOXRUQQ7LYD",
  secretAccessKey: "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"
})
module.exports = function upload(req, res) {
  var form = new IncomingForm()
  var myFile = ""
  form.multiples = true
  form.keepExtensions = true
  form.uploadDir = uploadDir
  form.parse(req, (err, fields, files) => {
    if (err) return res.status(500).json({ error: err })
    res.status(200).json({ uploaded: true })
  })
  form.on("fileBegin", function(name, file) {
    file.path = path.join(uploadDir, file.name)
    myFile = file.name
  })
  form.on("end", function() {
    uploadFile(myFile)
  })
}
const uploadFile = fileName => {
  const fileContent = fs.readFileSync("./files/" + fileName)

  const params = {
    Bucket: "bucket-epsi-react",
    Key: fileName,
    Body: fileContent
  }
  s3.upload(params, function(err, data) {
    if (err) {
      throw err
    }
    console.log(`File uploaded successfully. ${data.Location}`)
  })
}
