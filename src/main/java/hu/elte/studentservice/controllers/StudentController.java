package hu.elte.studentservice.controllers;

import hu.elte.studentservice.entities.Student;
import org.springframework.hateoas.EntityModel;
import hu.elte.studentservice.other.StudentNotFoundException;
import hu.elte.studentservice.repositories.StudentRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("/students")
public class StudentController {

    private final StudentRepository repository;

    public StudentController(StudentRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    List<Student> all() {
        return repository.findAll();
    }

    @PostMapping
    Student newStudent(@RequestBody Student newStudent) {
        return repository.save(newStudent);
    }

    @GetMapping("/{id}")
    EntityModel<Student> one(@PathVariable Long id) {

        Student employee = repository.findById(id)
                .orElseThrow(() -> new StudentNotFoundException(id));

        return EntityModel.of(employee,
                linkTo(methodOn(StudentController.class).one(id)).withSelfRel(),
                linkTo(methodOn(StudentController.class).all()).withRel("students"));
    }

    @PutMapping("/{id}")
    Student replaceEmployee(@RequestBody Student newStudent, @PathVariable Long id) {

        return repository.findById(id)
                .map(student -> {
                    student.setName(newStudent.getName());
                    return repository.save(student);
                })
                .orElseGet(() -> {
                    newStudent.setId(id);
                    return repository.save(newStudent);
                });
    }

    @DeleteMapping("/{id}")
    void deleteEmployee(@PathVariable Long id) {
        repository.deleteById(id);
    }

}
