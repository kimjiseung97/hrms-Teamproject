package com.hrms.project4th.mvc.service;

import com.hrms.project4th.mvc.dto.requestDTO.AddEmployeesDTO;
import com.hrms.project4th.mvc.dto.requestDTO.ModifyEmployeeDTO;
import com.hrms.project4th.mvc.dto.requestDTO.MyBossRequestDTO;
import com.hrms.project4th.mvc.dto.responseDTO.EmployeeDetailResponseDTO;
import com.hrms.project4th.mvc.dto.responseDTO.GetMyBossResponseDTO;
import com.hrms.project4th.mvc.entity.CheckPassword;
import com.hrms.project4th.mvc.entity.Employees;
import com.hrms.project4th.mvc.repository.EmployeesMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmployeesService {

    private final EmployeesMapper employeesMapper;
    private final PasswordEncoder encoder;

    public List<Employees> getEmployeesList() {
       return employeesMapper.getEmployeesList();
    }

    public List<EmployeeDetailResponseDTO> getDetailEmployeesList() {
        return employeesMapper.getDetailEmployeesList();
    }

    public boolean addEmployee(AddEmployeesDTO dto, String savePath) {
        Employees emp = new Employees(dto, savePath);
        return employeesMapper.addEmployee(emp);
    }

    public boolean removeEmployee(long empNo){
        return employeesMapper.removeEmployee(empNo);
    }

    public boolean modifyEmployees(ModifyEmployeeDTO dto, String savePath) {
        Employees emp = new Employees(dto, savePath);
        return employeesMapper.modifyEmployees(emp);
    }
    public boolean modifyEmployeesWithNoProfile(ModifyEmployeeDTO dto) {
        return employeesMapper.modifyEmployeesWithNoProfile(new Employees(dto));
    }

    public List<GetMyBossResponseDTO> getMyBossNames(MyBossRequestDTO dto) {
        log.info("service : {}, {}", dto.getDeptCode(), dto.getPosCode());
        return employeesMapper.getMyBossNames(dto)
                .stream()
                .filter(e -> e.getPosCode().compareTo(dto.getPosCode()) < 0)
                .map(GetMyBossResponseDTO::new)
                .collect(Collectors.toList());
    }

    public boolean isDuplicated(String email) {
        return employeesMapper.isDuplicated(email);
    }



    // 사원의 번호 수정
    public boolean updatePhoneNumber(String newPhone, String empEmail){
        log.info("newPhone : {} {}", newPhone, empEmail);

        log.info(empEmail);
        return employeesMapper.updatePhoneNumber(empEmail, newPhone);
    }



    public List<EmployeeDetailResponseDTO> getDetailEmployeesListByDept(String deptCode) {
        return employeesMapper.getDetailEmployeesListByDept(deptCode);
    }

    public List<EmployeeDetailResponseDTO> getDeptHeadList() {
        return employeesMapper.getDeptHeadList();
    }

    public EmployeeDetailResponseDTO getDetailedEmployee(long empNo) {
        EmployeeDetailResponseDTO dto = employeesMapper.getDetailedEmployee(empNo);
//        dto.profileWithRootPath(dto.getProfile());
        dto.gettingEmailAccount(dto.getEmpEmail());
        return dto;
    }

    public List<EmployeeDetailResponseDTO> searchEmployeesByName(String empName) {
        return employeesMapper.searchEmployeesByName(empName);
    }


    public boolean updatePassword(String empEmail, String newPassword){

      return employeesMapper.updatePassword(empEmail, newPassword);
    }

//    public CheckPassword checkCurrentPwd(String checkPwd, String empEmail) {
//        log.info("checkCurrentPwd service! ");
//        Employees foundEmployee = employeesMapper.findEmployee(empEmail);
//
//        log.info("foundEmployee , ", foundEmployee.getEmpName());
////        encoder.matches(checkPwd, storedPassword)
//        if (encoder.matches(checkPwd, foundEmployee.getEmpPassword()) || checkPwd.matches(foundEmployee.getEmpPassword())) {
//
//            return foundEmployee;
//
//        } else {
//            return null;
//        }
//
//    }
}
