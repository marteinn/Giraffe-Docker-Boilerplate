# Giraffe-Docker-Boilerplate

This is a docker based [Giraffe](https://github.com/giraffe-fsharp/Giraffe) boilerplate that uses the giraffe-template to give you a fresh project to get started with.


## Clean install

1. Copy configuration

    ```
    cp docker/config/web.example.env docker/config/web.env
    ```

2. Open `docker/config/web.env` and change `SCAFFOLD_APP_NAME=` to the otp name you want for your app
3. Run: docker-compose up
4. Done. Visit [localhost:5000](http://localhost:5000)


## License

Giraffe-Docker-Boilerplate is released under the [MIT License](http://www.opensource.org/licenses/MIT).
