package com.conorsheppard.controller;

import com.conorsheppard.app.entity.Account;
import com.conorsheppard.app.repo.AccountRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Optional;

@RestController
@RequestMapping("/account")
public class AccountController {

    private final AccountRepository repo;

    public AccountController(AccountRepository repo) {
        this.repo = repo;
    }

    @PostMapping("/{id}/deposit")
    public ResponseEntity<String> deposit(@PathVariable Long id, @RequestParam BigDecimal amount) {
        Account acc = repo.findById(id).orElse(new Account());
        acc.setId(id);
        acc.setBalance(Optional.ofNullable(acc.getBalance()).orElse(BigDecimal.ZERO).add(amount));
        repo.save(acc);
        return ResponseEntity.ok("Deposit successful");
    }
}

