package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import service.charge.group9.alliance.ServiceChargeAppGroup9.common.models.ApiResponse;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.UserRole;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.messages.Messages;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.service.IUserRoleService;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.entity.User;

import java.util.List;

@RestController
@RequestMapping("/user-role")
public class UserRoleController {

    @Autowired
    private IUserRoleService serv;

    @PostMapping("/create")
    @ResponseBody
    public ApiResponse save(UserRole userRole){
        UserRole savedUserRole = serv.saveUserRole(userRole);
        if (savedUserRole != null){
            ApiResponse.CreateSuccess(savedUserRole, Messages.USER_ROLE_SUCCESSFULLY_SAVED);
        }
        return ApiResponse.CreateError( Messages.USER_ROLE_NOT_SAVED);
    }

    @RequestMapping("/all")
    public ApiResponse retrieveAllUserRole(){
        List<UserRole> userRoleList = serv.getAllUserRole();
        return ApiResponse.CreateSuccess(userRoleList,Messages.USER_ROLE_SUCCESSFULLY_RETRIEVE);
    }

    @GetMapping("/{id}")
    public ApiResponse getById(@PathVariable int id) {
        try {
            UserRole savedUserRole = serv.findUserRoleByID(id);
            return ApiResponse.CreateSuccess(savedUserRole,Messages.USER_ROLE_FOUND);
        } catch (Exception e) {
            return ApiResponse.CreateError(Messages.USER_ROLE_NOT_FOUND);
        }
    }
    @GetMapping("/{userID}/{roleID}")
    public ApiResponse getById(@PathVariable int userID,@PathVariable int roleID) {
        try {
            int savedUserRole = serv.findUserRoleId(userID,roleID);
            return ApiResponse.CreateSuccess(savedUserRole,Messages.USER_ROLE_FOUND);
        } catch (Exception e) {
            return ApiResponse.CreateError(Messages.USER_ROLE_NOT_FOUND);
        }
    }
    @PostMapping("/update")
    @ResponseBody
    public ApiResponse update(UserRole userRole){
        UserRole savedUserRole = serv.saveUserRole(userRole);
        if (savedUserRole != null){
            return ApiResponse.CreateSuccess(savedUserRole, Messages.USER_ROLE_SUCCESSFULLY_UPDATED);
        }
        return ApiResponse.CreateError( Messages.USER_ROLE_NOT_SAVED);
     }

    @DeleteMapping("/delete/{id}")
    public ApiResponse deleteUserRole(@PathVariable int id){
        try{

            serv.deleteUserRole(id);
            return ApiResponse.CreateSuccess(Messages.USER_ROLE_SUCCESSFULLY_DELETED);
        }catch (Exception e){
            return ApiResponse.CreateError(Messages.USER_ROLE_NOT_FOUND);
        }
    }
    @GetMapping("/findID/{id}")
    public ApiResponse findRoleByUserID(@PathVariable int id) {
        try {
            String savedUserRole = serv.findRoleByUserID(id);
            return ApiResponse.CreateSuccess(savedUserRole,Messages.USER_ROLE_FOUND);
        } catch (Exception e) {
            return ApiResponse.CreateError(Messages.USER_ROLE_NOT_FOUND);
        }
    }

}
