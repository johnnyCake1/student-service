package hu.elte.studentservice;

import static org.assertj.core.api.Assertions.assertThat;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.Optional;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class StudentServiceApplicationTests {

    private final HttpClient client = HttpClient.newBuilder().build();

    @Test
    @DisplayName("Ensures API calls return status code is 200")
    void ensureThatUserAPICallReturnStatusCode200() throws Exception {
        HttpRequest request = HttpRequest.newBuilder().uri(URI.create("http://localhost:8080/students")).build();
        System.out.println(request);
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        assertThat(response.statusCode()).isEqualTo(200);

    }

    @Test
    @DisplayName("Ensures that the content type starts with application/json")
    void ensureThatJsonIsReturnedAsContentType() throws Exception {
        HttpRequest request = HttpRequest.newBuilder().uri(URI.create("http://localhost:8080/students")).build();
        HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
        Optional<String> firstValue = response.headers().firstValue("Content-Type");
        String string = firstValue.get();
        assertThat(string).startsWith("application/json");
    }

    @Test
    @DisplayName("Ensure if POST request is valid")
    void ensurePostRequestIsValid() throws Exception {

        String jsonInputString = "{\"name\": \"Jimbo\", \"age\": 32}";

        HttpRequest postRequest = HttpRequest.newBuilder()
                .uri(URI.create("http://localhost:8080/students"))
                .POST(HttpRequest.BodyPublishers.ofString(jsonInputString))
                .build();
        HttpResponse<String> postResponse = client.send(postRequest,
                HttpResponse.BodyHandlers.ofString());

        HttpRequest getRequest = HttpRequest.newBuilder()
                .uri(URI.create("http://localhost:8080/students"))
                .build();
        HttpResponse<String> getResponse = client.send(getRequest,
                HttpResponse.BodyHandlers.ofString());

//        assertThat(getResponse.body().equals(jsonInputString))

    }

}
