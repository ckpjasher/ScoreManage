package com.learn.system.service.serviceImpl;

import com.learn.system.mapper.AccountMapper;
import com.learn.system.pojo.Account;
import com.learn.system.service.AccountService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class AccountServiceImpl implements AccountService {
    private AccountMapper accountMapper;

    @Override
    public int checkUsername(String username) {
        return accountMapper.checkUsername(username);
    }

    @Override
    public void insertAccount(Account acc) {
        accountMapper.insertAccount(acc);
    }

    @Override
    public String checkPassword(String username) {
        return accountMapper.checkPassword(username);
    }

    @Override
    public int getAuthority(String username){
        return accountMapper.getAuthority(username);
    }

    @Override
    public int checkIsStuLegal(String username) {
        return accountMapper.checkIsStuLegal(username);
    }
}
