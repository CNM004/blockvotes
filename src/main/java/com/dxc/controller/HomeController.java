package com.dxc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.security.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dxc.chain.Block;
import com.dxc.chain.CandidateChain;
import com.dxc.chain.StringUtil;
import com.dxc.chain.Transaction;
import com.dxc.chain.TransactionConvert;
import com.dxc.chain.TransactionOutput;
import com.dxc.chain.VoteResult;
import com.dxc.chain.Wallet;
import com.dxc.entity.Candidate;
import com.dxc.entity.User;
import com.dxc.filter.UserCriteria;
import com.dxc.service.UserService;


@Controller
public class HomeController {

	public static List<Block> blockchain = new ArrayList<Block>();
	public static HashMap<String, TransactionOutput> UTXOs = new HashMap<String, TransactionOutput>();
	public static List<Wallet> wallets = new ArrayList<Wallet>();
	public static List<CandidateChain> candidates = new ArrayList<CandidateChain>();

	List<TransactionConvert> result = new ArrayList<TransactionConvert>();
	int index = 0;

	public static int difficulty = 3;
	public static float minimumTransaction = 0.1f;
	public static Transaction genesisTransaction;
	public static Wallet newWallet;

	public static Wallet walletA;
	public static Wallet walletB;

	public static Wallet mainWallet;

	@Autowired
	UserService userService;

	public static boolean isNullOrEmpty(String str) {
		if (str != null && !str.isEmpty())
			return false;
		return true;
	}

	public static void addBlock(Block newBlock) {
		newBlock.mineBlock(difficulty);
		blockchain.add(newBlock);
	}

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@GetMapping("/vote-result")
	public String voteResult(Model model) {

		if(candidates.size()>0) {
			List<String> voteResults = new ArrayList<String>() {
				{
					add(candidates.get(0).getName()+":"+wallets.get(1).getBalance());
					add(candidates.get(1).getName()+":"+wallets.get(2).getBalance());
					add(candidates.get(2).getName()+":"+wallets.get(3).getBalance());
				}
			};
			
			model.addAttribute("voteResults", voteResults);
			model.addAttribute("result", result);
		}
		
		return "vote-result";
	}
	
	@GetMapping("/vote-detail")
	public String voteDetailt(Model model) {
		model.addAttribute("candidates", candidates);
		return "vote-detail";
	}
	
	@GetMapping("/candidates")
	public String Candidate(Model model) {
		//List<User> users = userService.findAll();
		model.addAttribute("candidates", candidates);
		model.addAttribute("total", candidates.size());
		return "candidate";
	}
	
	@GetMapping("/histories")
	public String History(Model model) {
		model.addAttribute("result", result);
		model.addAttribute("total", result.size());
		return "history";
	}
	
	@GetMapping("/profile")
	public String Profile(Model model) {
		return "profile";
	}
	
	/*
	 * @PostMapping("/getData")
	 * 
	 * @ResponseBody public List<TransactionConvert> getData() {
	 * Security.addProvider(new
	 * org.bouncycastle.jce.provider.BouncyCastleProvider()); if (blockchain.size()
	 * > 0) { for (int i = index; i < blockchain.size(); i++) {
	 * System.out.println("block " + i + ":"); List<Transaction> transBlock =
	 * blockchain.get(i).transactions; if (transBlock.size() > 0) {
	 * TransactionConvert e = new
	 * TransactionConvert(transBlock.get(0).transactionId,
	 * transBlock.get(0).sender.toString(), transBlock.get(0).reciepient.toString(),
	 * transBlock.get(0).value); result.add(e); } } index = blockchain.size(); }
	 * return result; }
	 */

	@PostMapping("/admin/setting")
	@ResponseBody
	public byte[] settingWallet() {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		try {
			List<Candidate> candidateEntities = userService.findAllCandidates();
			if (blockchain.size() == 0) {
				mainWallet = new Wallet();
				Wallet coinbase = new Wallet();
				genesisTransaction = new Transaction(coinbase.publicKey, mainWallet.publicKey, 1000000, null);
				genesisTransaction.generateSignature(coinbase.privateKey);
				genesisTransaction.transactionId = "0";
				genesisTransaction.outputs.add(new TransactionOutput(genesisTransaction.reciepient,
						genesisTransaction.value, genesisTransaction.transactionId));
				UTXOs.put(genesisTransaction.outputs.get(0).id, genesisTransaction.outputs.get(0));
				Block genesis = new Block("0");
				genesis.addTransaction(genesisTransaction);
				addBlock(genesis);
				wallets.add(mainWallet);
				
				for (int i = 0; i < candidateEntities.size(); i++) {
					newWallet = new Wallet();
					Block block = new Block(blockchain.get(blockchain.size() - 1).hash);
					block.addTransaction(wallets.get(0).sendFunds(newWallet.publicKey, 0));
					addBlock(block);
					wallets.add(newWallet);
					candidates.add(new CandidateChain(candidateEntities.get(i).getFullname(), candidateEntities.get(i).getDetails(), newWallet.publicKey.toString().trim()));
				}
				return "Created Candidates successfull".getBytes(StandardCharsets.UTF_8);
			} else {
				return "You created Candidates before!".getBytes(StandardCharsets.UTF_8);
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return "Created Candidate failed. Please contact system admin".getBytes(StandardCharsets.UTF_8);
		}
	}
	
	@PostMapping("/getCandidates")
	@ResponseBody
	public List<CandidateChain> getCandidates() {
		
		return candidates;
	}

	@PostMapping("/user/create-user")
	@ResponseBody
	public byte[] saveWallet() {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		try {
			String username="";
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof UserDetails) {
				username = ((UserDetails)principal).getUsername();
			} else {
				username = principal.toString();
			}
			UserCriteria criteria = new UserCriteria(username, "");
			List<User> users = userService.findUserByCriteria(criteria);
			User user = users.get(0);
			boolean flag = true;
			// can check user.getPrivateKey() != "" because when user created wallet, user will be update with publickey and privateKy
			for(int i=1; i<wallets.size(); i++) {
				if(isNullOrEmpty(user.getPrivateKey())) {
					flag = true;
					break;
				}
				else if(StringUtil.comparrKey(wallets.get(i).privateKey.toString(), user.getPrivateKey())) {
					flag=false;
					break;
				}
			}
			if(flag) {
				newWallet = new Wallet();
				Block block = new Block(blockchain.get(blockchain.size() - 1).hash);
				block.addTransaction(wallets.get(0).sendFunds(newWallet.publicKey, 1));
				addBlock(block);
				wallets.add(newWallet);
				
				user.setPrivateKey(newWallet.privateKey.toString().trim());
				user.setPublicKey(newWallet.publicKey.toString().trim());
				userService.update(user);
				return "Successfully!".getBytes(StandardCharsets.UTF_8);
			}
			else {
				return "Failed! This account completed the Begin function".getBytes(StandardCharsets.UTF_8);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return "Failed! Please contact system admin!".getBytes(StandardCharsets.UTF_8);
		}
	}

	@PostMapping("/get-count-vote")
	@ResponseBody
	public int countVote(@RequestBody String privateKey) {
		if (wallets.size() > 0) {
			for (int i = 0; i < wallets.size(); i++) {
				if (StringUtil.comparrKey(wallets.get(i).privateKey.toString().trim(), privateKey.trim()))
					return wallets.get(i).getBalance();
			}
		}
		return 0;
	}

	@PostMapping("/vote")
	@ResponseBody
	public String vote(@RequestParam("to") String to) {
		// get privatekey from user login
		String from = "";
		String username = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			username = ((UserDetails)principal).getUsername();
		} else {
			username = principal.toString();
		}
		UserCriteria criteria = new UserCriteria(username, "");
		List<User> users = userService.findUserByCriteria(criteria);
		User user = users.get(0);
		// data is public's candicate
		Wallet fromWallet = new Wallet();
		Wallet toWallet = new Wallet();
		int flag = 0;
		if (wallets.size() > 0) {
			for (int i = 0; i < wallets.size(); i++) {
				if (StringUtil.comparrKeyHtml(wallets.get(i).privateKey.toString(), user.getPrivateKey())) {
					fromWallet = wallets.get(i);
					flag++;
					if (flag == 2)
						break;
				} else if (StringUtil.comparrKeyHtml(wallets.get(i).publicKey.toString(), to)) {
					toWallet = wallets.get(i);
					flag++;
					if (flag == 2)
						break;
				}
			}
		}
		String name="";
		for(int i=0; i<candidates.size(); i++) {
			if (StringUtil.comparrKey(candidates.get(i).getPublicKey().toString(), to)) {
				name = candidates.get(i).getName();
			}
		}
		Block block1 = new Block(blockchain.get(blockchain.size() - 1).hash);
		boolean isSuccess = block1.addTransaction(fromWallet.sendFunds(toWallet.publicKey, 1));
		if(isSuccess) {
			addBlock(block1);
			List<Transaction> transBlock = blockchain.get(blockchain.size() - 1).transactions;
			TransactionConvert e = new TransactionConvert(transBlock.get(0).transactionId,
					transBlock.get(0).sender.toString(), transBlock.get(0).reciepient.toString(), name, new Date(block1.timeStamp));
			result.add(e);
			return "Cheers, you voted to candidate! Thank you for contributing to society!";
		}
		else {
			return "Sorry, you can only have once voted for each  attempt!";
		}
		
	}

	//// test console
	public static void main(String[] args) {
		// add our blocks to the blockchain ArrayList:
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider()); // Setup Bouncey castle as a
		// Create wallets:
		walletA = new Wallet();
		walletB = new Wallet();
		Wallet coinbase = new Wallet();

		genesisTransaction = new Transaction(coinbase.publicKey, walletA.publicKey, 1, null);
		genesisTransaction.generateSignature(coinbase.privateKey); 
		genesisTransaction.transactionId = "0";
		genesisTransaction.outputs.add(new TransactionOutput(genesisTransaction.reciepient, genesisTransaction.value,
				genesisTransaction.transactionId)); 
		UTXOs.put(genesisTransaction.outputs.get(0).id, genesisTransaction.outputs.get(0));
		System.out.println("Creating and Mining Genesis block... ");
		Block genesis = new Block("0");
		genesis.addTransaction(genesisTransaction);
		addBlock(genesis);

		// testing
		Block block1 = new Block(genesis.hash);
		block1.addTransaction(walletA.sendFunds(walletB.publicKey, 1));
		addBlock(block1);
		System.out.println("\nWalletA\'s balance is: " + walletA.getBalance());
		System.out.println("WalletB\'s balance is: " + walletB.getBalance());

		System.out.println("Histories block");

		if (blockchain.size() > 0) {
			for (int i = 0; i < blockchain.size(); i++) {
				System.out.println("block " + i + ":");
				List<Transaction> transBlock = blockchain.get(i).transactions;
				if (transBlock.size() > 0) {
					System.out.println(transBlock.get(0).toString());
				} else {
					System.out.println("Block " + i + " have no transaction");
				}

			}
		}
	}

}
