# 1: The Web: An Introduction ------------------------------

* L.O. What is the client-server relationship?

  - Clients are: Chrome, Safari, httpie (Command line), spotlight :
                  anything that makes requests and receives responses from
                  local or remote (web) servers.

                  The client isn't concerned with anything beyond sending and
                  receiving messages. Handling and interpreting the data is
                  responsibility of the server.

  - Servers :  Facebook, Google and BBC all have broad server networks made up of
               thousands (or millions) of physical and virtual machines that
               may be distributed all across the globe.

               These machines work together receiving and interpreting client
               requests, handling data and ideally returning appropriate responses,
               or otherwise raising errors.

 - Communication Protocols : HTTP, FTP, POP3, TCP/IP : These are the languages
                             and rules by which clients and servers can communicate.

------------------------------------------

(brew install httpie)

* Use httpie to make a request

    - $ http http://makersipsum.herokuapp.com/

    - Returns a snapshot of server metadata such as 'connection', 'content type'
      'date', 'server details' etc.

    - The command-line running httpie is the 'client' in this scenario.


# 2: The Hypertext Transfer Protocol (HTTP) ----------------------

* Know a request from a response, and the important elements of each...


- use httpie's "-v" (verbose) flag to make a request

    - $ http -v http://makersipsum.herokuapp.com/

    - The response can be divided into 3 sections:
      - first the "GET" request, from "GET" down to "User-Agent" - this is the
        request from the client.
      - The response headers (from the server)
      - Lastly the 'body' text of the website in this case (HTML and Markup)
        this is also part of the server's response.

# 3: HTTP Parameters --------------------------------------------

* Recognise the query string in a URL

* Query string paramaters are key-value pairs sent with http requests

* Structure of query string

in:   http://www.example.com/home?name=Bob&age=21

" ?name=Bob&age=21 " is the query string

"name=Bob" and "age=21" are the parameters (in key=value pairs)

* To send parameters in a query string, merely append them to the end of the URL's
  query string.

  Useful site : https://doepud.co.uk/blog.php/anatomy-of-a-url


# 4: HTTP: GET / POST Requests  -------------------------------------

* GET vs POST requests

- GET fetches data, whereas POST creates it.

- POST is generally safer when dealing with sensitive data.

- Included in the first line of the client's metadata in a request, we can see
  whether we are making a GET or POST request.

 $ http -v -f POST https://getpostworkout.herokuapp.com/ name=catname

- '-f' will allow us to make a POST request to the above website and the '-v' flag
  will reveal the type of request (POST)


# 5: Sinatra: Getting started  -------------------------------------

* Create a Sinatra application

  - Create a project directory and add " gem 'sinatra' " to the project Gemfile
  - Create a app.rb file in the dir
  - Require sinatra at the top of the file

* Run the Sinatra app locally

  - run the app: $ ruby app.rb (which will also load Sinatra)
  - Visit the website with http://localhost:4567

# 6: Sinatra: Defining a route  -------------------------------------

* Sinatra returns an error, but tells us what to do with it. In the app.rb add:

    get '/' do
      "Hello World."
    end

    - When we load our page again we'll be greeted with our "Hello World" message.
      This is because we have now defined the path.

    - '/' is the request path in this case, '/' usually activates the server's
      'root' route. Some websites/browsers hide the '/' path.

# 7: Sinatra: Start and Restart ----------------------------------------

* Definition of a route:

  (e.g.   get '/named-cat'  ,
  or:     get '/random-cat' ,
  or:     post '/cat'       )

  Routes are the various entry points into a application, we can access different server actions or responses by activating different routes.

  In Sinatra, a route is an HTTP method paired with a URL-matching pattern.
  Each route is associated with a block.

  * Use Shotgun

    - Shotgun allows a user to create a local server that (like Sinatra) can hold
      content (text, pictures whatever), but unlike Sinatra, Shotgun facilitates
      dynamic changes - it works by reloading your entire application on every
      request.

    - To use shotgun : $ Shotgun app.rb

        - Then run the same URL with Shotgun's specified ports (usually 9393)

        - These ports can be set with '-p' flag - $ shotgun <filename> -p 1234

# 8: Sinatra: Returning HTML  --------------------------

* Return HTML from a Sinatra route

example:

  get '/my_gallery' do
    "<img src='my_pic.png'>"
  end

# 9: Sinatra: Views

* Explain the phrase 'Separation of Concerns'

  - SoC is the ideology that each part of your code (classes, files etc) should
    each serve just one purpose and have a defined range of responsibility.

    e.g. in the above example, the code beginning <img src=... should really go
    in another file (e.g. views), as it is not the responsibility of our app.rb.

* Use Views to separate routing and presentation concerns


# 10: Sinatra: erb

* Embed a Ruby expression within a View:

example:

    get '/another-route' do
      erb "Hi there, Visitor <%= 2 + 2 %>!"
    end

    - "ERB (Embedded RuBy) is a feature of Ruby that enables you to conveniently
      generate any kind of text, in any quantity, from templates."

    - Part of the standard Ruby librari, i.e. no need to install anything else.

example 2:

require 'erb'

  weekday = Time.now.strftime('%A')
  simple_template = "Today is <%= weekday %>."

  renderer = ERB.new(simple_template)
  puts output = renderer.result()


# 11: Sinatra: Keeping views clean --------------------------

* Refactor view logic to controller logic

    <h1>Hi my name is <%= ["Amigo", "Oscar", "Viking"].sample %></h1>
    <div style='border: 3px dashed red'>
    <img src='http://bit.ly/1eze8aE'>
    </div>

- In the above example we've littered our views (presentation) folder with complex
  Ruby expressions, which, according to SoC, really belong in a separate .rb file.

-  "Move the expression for generating a random name into the route for your view,
   assigning  it to an instance variable": 

  get '/cat' do
    @name = ["Amigo", "Oscar", "Viking"].sample
    erb(:cat)
  end


# 12:
