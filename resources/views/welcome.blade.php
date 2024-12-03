<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          
          body {
            font-family: Arial, sans-serif;
            position: relative;
          }
          
          .container {
            position: absolute;
            top: 0;
            left: 0;
            height: 100vh;
            width: 100vw;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-content: center;
            gap: 3rem;
            
          }
          .title {
            display: flex;
            flex-direction: row;
            width: 100%;
            justify-content: center;
            gap: 5%;
            font-size: 10vw;
            color: black;
          }
          
          .sign-in {
            display: flex;
            justify-content: center;
            /*background: linear-gradient(45deg, #FF6859, #FFCF44, #B15DFF, #72DEFF);*/
          }
          .librix {
            color: #1d72e7;
            font-weight: 600;
          }
          
          .librix:nth-child(2) { color: #FF6859; }  /* S */
          .librix:nth-child(3) { color: #FFCF44; }  /* h */
          .librix:nth-child(4) { color: #72DEFF; }  /* w */
          .librix:nth-child(5) { color: #B15DFF; }  /* e */
          .librix:nth-child(6) { color: #6cff59; }  /* P */
          .librix:nth-child(7) { color: #fffc59; }  /* y */
          .librix:nth-child(8) { color: #5c59ff; }  /* i */
           
          .sign-in-btn {
            touch-action: manipulation;
            margin-top: 20px;
            background-color: #3385FF;
            border: none;
            border-radius: 20px;
            padding: 15px 30px;
            font-size: 1.2rem;
            font-weight: 600;
            color: white;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
            background: linear-gradient(45deg, #FF6859, #0c695d, #B15DFF, #72DEFF);
          }
          
          .sign-in-btn:hover {
            transform: scale(1.1);
            background: linear-gradient(315deg, #FF6859, #0c695d, #B15DFF, #72DEFF);
          }
          .top-corner {
            position: absolute;
            top: -106px;
            right: 0rem;
            width: 31vw;
            overflow: hidden;
          }

          .bottom-corner {
            position: absolute;
            bottom: 0rem;
            overflow: hidden;
            width: 100vw;
          }

          .bottom-corner img {
            width: 40vw;
            height: 40vh;
          }
          .main {
            height: 100vh;
          }

          a {
            text-decoration: none;
            color: white;
          }
    </style>
</head>
<body>
    <div class="main">
        <div class="top-corner">
            <img  src="{{ asset('storage/path824.png') }}" alt="">
        </div>
        <div class="bottom-corner">
            <img  src="{{ asset('storage/bottom-corner.png') }}" alt="">
        </div>
        
        <div class="container">
            <div class="title">
                <span class="icon">📚</span>
                <span class="librix">S</span>
                <span class="librix">h</span>
                <span class="librix">w</span>
                <span class="librix">e</span>
                <span class="librix">P</span>
                <span class="librix">y</span>
                <span class="librix">i</span>
            </div>
            <div class="sign-in">
                <button class="sign-in-btn"><a href="#">Get Started</a></button>
            </div>
        </div>
    </div>    
</body>
</html>