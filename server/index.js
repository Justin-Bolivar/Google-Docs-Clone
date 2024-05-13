const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const authRouter = require("./routes/auth");
const documentRouter = require("./routes/document");


const PORT = 3001;

const app = express();

app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(documentRouter);

const DB = "mongodb+srv://justinbolivar:rootpassword@docscluster.brudllv.mongodb.net/?retryWrites=true&w=majority&appName=DocsCluster"


mongoose.connect(DB).then(() => {
    console.log("Connected to MongoDB");

}).catch((err) => { console.log(err)});

app.listen(PORT, "0.0.0.0", () => {console.log(`Connected at port ${PORT}`);} );